const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const JWT = require("jsonwebtoken");
const authModel = require("../models/authModel");



// signup
exports.signUp = async (req, res) => {
  try {
    const { name, email, password, role } = req.body;

    // Check if user already exists
    const isUserExist = await authModel.findOne({ email });
    if (isUserExist) {
      return res.status(400).json({
        success: false,
        message: "User already exists",
      });
    }

    // Hash the password
    const hashPass = await bcrypt.hash(password, 8);

    // Create new user
    const user = await authModel.create({
      name,
      email,
      password: hashPass,
      role,
    });

    // Respond with success (no password in response)
    return res.status(201).json({
      success: true,
      message: "User created successfully",
      user: {
        name: user.name,
        email: user.email,
        role: user.role,
      },
    });
  } catch (error) {
    console.error("Signup Error:", error.message);
    return res.status(500).json({
      success: false,
      message: "Unable to create user",
      error: error.message,
    });
  }
};



//login  
exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if user exists
    const user = await authModel.findOne({ email });
    if (!user) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    // Compare password
    const passMatch = await bcrypt.compare(password, user.password);
    if (!passMatch) {
      return res.status(401).json({
        success: false,
        message: "Incorrect password",
      });
    }

    // Create JWT payload
    const payload = {
      id: user._id,
      email: user.email,
      role: user.role,
    };

    // Generate token
    const token = JWT.sign(payload, process.env.JWT_SECRET, { expiresIn: "2d" });

    // Send token back
    return res.status(200).json({
      success: true,
      message: "Login successful",
      token,
      user: {
        id: user._id,
        name: user.name,
        email: user.email,
        role: user.role,
      },
    });
  } catch (error) {
    console.error("Login Error:", error.message);
    return res.status(500).json({
      success: false,
      message: "Unable to login",
      error: error.message,
    });
  }
};
