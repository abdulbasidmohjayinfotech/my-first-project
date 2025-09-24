const File = require("../models/file");


//local file upload -->> handler function

exports.localFileUpload = async(req, res)=>{
    try {
        //fetch file from request 
        const file = req.files.file;
        console.log(file);

        //creating path where file need to be stored on server
        const path = __dirname + "/files/"+ Date.now() + `.${file.name.split('.')[1]}`;
        console.log("path-->", path);

        //add path to move function
        file.mv(path,(err)=>{
            console.log(err);
        });

        //creating a successful response
        res.json({
            success: true,
            message: "file upload successfully....."
        })



    } catch (error) {
        console.log("not able to upload file on server")
        console.log(error);
        
    }
}





// image upload handler for cloudinary

function isFileTypeSupported(type, supportedType){
    supportedType.include(type);
}



exports. imageUploads = async (req, res)=>{
    try {
        
        //data fetch
        const {name, tags, email} = req.body;
        console.log(name, tags, email);
        
        const file = req.files.file;
        console.log(file);

        //validation
        const supportedType = ["jpg", "jpeg", "png"];
        const fileType  = file.name.split('.')[1].toLowerCase();

        if(!isFileTypeSupported(fileType, supportedType)){
            return res.status(404).json({
                success: false,
                message: "file type is not suppoted"
            })
        }

        //file supported h to cloudinary pr upload krte hai
        
          
        
    } catch (error) {
        
    }
}

