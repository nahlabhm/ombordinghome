const Product = require("../models/product");

const addproduct = async (req, res) => {
  try {
    const { name, description, images, price, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      price,
      category,
    });

    product = await product.save();
    res.json(product);
  } catch (e) {
    console.log('Error:', e);
    res.status(500).json({ error: e.message });
  }
};

const getproduct = async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    console.log(e);
    res.status(500).json({ error: e.message });
  }
};

const deleteproduct = async (req, res) => {
   try {
    const { id } = req.params; // Use req.params to get the name from the URL
    const product = await Product.findOneAndDelete({ id });

    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }

    res.json({ message: 'Product deleted successfully', deletedProduct: product });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
const modifierproduct = async (req, res) => {
  try {
    const { name, description, images, price, category } = req.body;

    // Check if a product with the specified name exists
    const existingProduct = await Product.findOne({ name });

    if (!existingProduct) {
      return res.status(404).json({ error: 'Product not found' });
    }

    // Update the existing product with the specified fields
    existingProduct.name = name;
    existingProduct.description = description;
    existingProduct.images = images;
    existingProduct.price = price;
    existingProduct.category = category;

    // Save the updated product
    const updatedProduct = await existingProduct.save();

    res.json({ message: 'Product updated successfully', updatedProduct });
  } catch (e) {
    console.error('Error:', e);
    res.status(500).json({ error: e.message });
  }
};


module.exports = {
  addproduct,
  getproduct,
  deleteproduct,
  modifierproduct
};
