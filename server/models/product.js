
const mongoose=require("mongoose");

const ProductShema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
      },
      description: {
        type: String,
        required: true,
        trim: true,
      },
      images: [
        {
          type: String,
          required: true,
        },
      ],
  
      price: {
        type: String,
        required: true,
      },
      category: {
        type: String,
        required: true,
      },
})  ;
const Product = mongoose.model("Product", ProductShema);
module.exports = Product;
