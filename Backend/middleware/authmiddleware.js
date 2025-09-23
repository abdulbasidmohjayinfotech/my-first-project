const JWT = require("jsonwebtoken");
require("dotenv").config();

// Middleware to verify JWT token
exports.auth = (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith("Bearer ")) {
      return res.status(401).json({
        message: "Unauthorized: No token provided",
        success: false,
      });
    }

    const token = authHeader.split(" ")[1]; // Remove "Bearer "

    const decoded = JWT.verify(token, process.env.JWT_SECRET);


    console.log("Decoded JWT payload:", decoded); // Debug log
    req.user = decoded;
    next();
  }
   catch (error) {
    console.error("Auth Middleware Error:", error);
    return res.status(401).json({
      message: "Unauthorized: Invalid or expired token",
      success: false,
    });
  }
};




//for user
exports.isUser = (req, res, next)=>{
    try {
        if(req.user.role != 0){
            return res.status(403).json({
                success: false,
                message: "access denied"
            })
        }
        next();
    } catch (error) {
         res.status(403).json({
            success: false,
            message: "error....."
    })
}
}


//for admin
exports.isAdmin = (req, res, next)=>{
    try {
        if(req.user.role != 1){
            return res.status(403).json({
                success: false,
                message: "access denied"
            })
        }
        next();
    } catch (error) {
         res.status(403).json({
            success: false,
            message: "error....."
    })
}
}