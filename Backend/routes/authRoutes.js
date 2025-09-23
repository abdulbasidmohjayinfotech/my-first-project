const express = require("express")
const { login, signUp } = require("../controllers/authController")
const { isUser, auth, isAdmin } = require("../middleware/authmiddleware")
const router = express.Router()

router.post('/signup', signUp)
router.post('/login', login)

router.post('/user', auth, isUser, (req, res) => {
    res.json({
        success: true,
        message: "this is a protected route for user"
    })
})

router.post('/admin',auth, isAdmin, (req, res)=>{
    res.json({
        success: true,
        message: "this is a protected route for admin"
    })
})

module.exports = router;

