const express = require("express");
const router = express.Router();
const mysql = require("mysql2/promise");
const checkLoggedIn = require("../../middleware/checkLogin");

const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, "../../uploads"));
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + "-" + file.originalname);
    },
});
const upload = multer({ storage: storage });
const nodemailer = require('nodemailer');

//config database
const dbConfig = {
    host: "localhost",
    user: "root",
    password: "",
    database: "lms",
    // database: "lmsUpdate",
};
const pool = mysql.createPool(dbConfig);

router.use(checkLoggedIn)

// router.get("/student_page", async (req, res) => {try {
//         const connection = await pool.getConnection();
//         const student_id = req.cookies.uid;
//         const [studentInfo] = await connection.query(
//             "SELECT student_name, faculty.department_name FROM student INNER JOIN faculty ON student.student_department_id = faculty.department_id WHERE student_id = ?",
//             [student_id]
//         );
//         connection.release();
//         const studentName = studentInfo[0].student_name;
//         const facultyName = studentInfo[0].department_name;
//         res.render("student/student_page", { title: "Student", studentName, facultyName });
//     } catch (error) {console.error("Database query error:", error);res.status(500).json({ err: "Database query error" });}});
router.get("/view_post", async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const student_id = req.cookies.uid;
        const [rows] = await connection.query(
            "SELECT * FROM post WHERE article_author_id = ?",
            [student_id]
        );

        // Truy vấn các comment cho các bài post thuộc department
        const commentsPromises = rows.map(async (post) => {
            const [comments] = await connection.query(
                "SELECT * FROM comment INNER JOIN departmentmanager ON departmentmanager.department_manager_id = comment.author_id WHERE comment.article_id = ?",
                [post.article_id]
            );
            post.comments = comments;
            return post;
        });

        const posts = await Promise.all(commentsPromises);

        connection.release();
        res.render("student/view_post", { title: "Post", posts });
    } catch (error) {
        console.error("Database query error:", error);
        res.status(500).json({ err: "Database query error" });
    }
});


//view post
router.get("/view_post", async (req, res) => {
    const connection = await pool.getConnection();
    const student_id = req.cookies.uid;
    const [rows] = await connection.query(
        "SELECT * FROM post WHERE article_author_id = ?",
        [student_id]
    );
    console.log(rows);
    connection.release();
    res.render("student/view_post", { title: "Post", posts: rows });
});


//create post
router.get("/create_post", async (req, res) => {
    try {
        const student_id = req.cookies.uid;
        const connection = await pool.getConnection();

        const [studentInfo] = await connection.query(
            "SELECT student_department_id FROM student WHERE student_id = ?",
            [student_id]
        );

        const [magazines] = await connection.query(
            "SELECT * FROM magazine WHERE faculty_id = ?",
            [studentInfo[0].student_department_id]
        );

        connection.release();
        res.render("student/create_post", { magazines });
    } catch (error) {
        console.error("Database query error:", error);
        res.status(500).json({ err: "Database query error" });
    }
});
router.post("/create_post", upload.single("file"), async (req, res) => {
    const { title, content, student_id, magazine } = req.body;
    const file = req.file;
    try {
        const connection = await pool.getConnection();
        const [studentInfo] = await connection.query(
            "SELECT student.*, faculty.department_name FROM student LEFT JOIN faculty ON student.student_department_id = faculty.department_id WHERE student.student_id = ?",
            [student_id]
        );
        if (studentInfo.length > 0) {
            const studentDepartment = studentInfo[0].department_name;
            const [coordinators] = await connection.query(
                "SELECT * FROM departmentManager WHERE department_id IN (SELECT department_id FROM faculty WHERE department_name = ?)",
                [studentDepartment]
            );
            if (coordinators.length > 0) {
                const transporter = nodemailer.createTransport({
                    service: "gmail",
                    auth: {
                        user: "lecaohao2101@gmail.com",
                        pass: "zozsertkmqozztta",
                    },
                });
                coordinators.forEach(async (coordinator) => {
                    const mailOptions = {
                        from: "lecaohao2101@gmail.com",
                        to: coordinator.manager_email,
                        subject: "Notify students to post articles",
                        text: `Hello, coordinator ${coordinator.manager_name}! Student ${studentInfo[0].student_name} has posted an article. Thank you!`,
                    };
                    await transporter.sendMail(mailOptions);
                });
            }
        }
        const [rows] = await connection.query(
            "INSERT INTO post(article_title, article_content, article_file, article_author_id, article_created_at, article_updated_at, magazine_id) VALUES(?, ?, ?, ?, ?, ?, ?)",
            [title, content, file.filename, student_id, new Date().toString(), new Date().toString(), magazine]
        );
        connection.release();
        res.redirect("/student/view_post");
    } catch (error) {
        console.error("Database query error:", error);
        res.status(500).json({ err: "Database query error" });
    }
});


//edit my post
router.get("/edit_post/:article_id", async (req, res) => {
    const connection = await pool.getConnection();
    const student_id = req.cookies.uid;
    const article_id = req.params.article_id;
    const [rows] = await connection.query(
        "SELECT * FROM post WHERE article_author_id = ? AND article_id= ?",
        [student_id, article_id]
    );
    connection.release();
    res.render("student/edit_post", { title: "Post", article: rows[0] });
});
router.post("/edit_post/:article_id", upload.single("file"), async (req, res) => {
    const article_id = req.params.article_id;
    const { title, content, student_id, magazine } = req.body;
    const file = req.file;
    try {
        const connection = await pool.getConnection();
        let filename;
        if (file) {
            const [existingArticle] = await connection.query(
                "SELECT article_file FROM post WHERE article_id = ?",
                [article_id]
            );
            if (existingArticle && existingArticle.length > 0 && existingArticle[0].article_file) {
                const fs = require('fs');
                const filePath = path.join(__dirname, "../../uploads", existingArticle[0].article_file);
                fs.unlinkSync(filePath);
            }
            filename = file.filename;
        } else {
            const { file_old } = req.body;
            filename = file_old;
        }
        await connection.query(
            "UPDATE post SET article_title = ?, article_content = ?, article_file = ?, article_updated_at = ? WHERE article_id = ?",
            [title, content, filename, new Date().toString(), article_id]
        );
        connection.release();
        res.redirect("/student/view_post");
    } catch (error) {
        console.error("Database query error:", error);
        res.status(500).json({ err: "Database query error" });
    }
});


module.exports = router;
