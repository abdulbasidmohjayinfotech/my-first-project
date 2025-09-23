const mongoose = require('mongoose')


const authSchema = new mongoose.Schema({
    name : {
        type: String,
        require : true,
    },
    email : {
        type : String,
        require : true,
        unique : true
    },
    password : {
        type : String,
        require : true,
        unique : true
    },
    role : {
        type : Number,
        default: 0
    }
})

module.exports = mongoose.model("Auth", authSchema);