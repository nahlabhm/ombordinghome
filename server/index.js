const mongoose = require("mongoose");
const express = require("express");
const productrouter = require("./router/productrouter");

const app = express();
app.use(express.json());

app.use('/api/v1/user', productrouter);

const db = "mongodb+srv://nahlabenhajmabrouk:nahla2021*@cluster0.cr5quzv.mongodb.net/?retryWrites=true&w=majority";

app.listen(3000, () => console.log("connected"));

mongoose.connect(db).then(() => {
  console.log("connected successfully");
}).catch((e) => {
  console.log(e);
});
