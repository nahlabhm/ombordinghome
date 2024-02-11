const { Router } = require("express");
const controllerproduct = require("../controller/productcontroller");

const router = Router();

router.post('/add', controllerproduct.addproduct);
router.get('/', controllerproduct.getproduct);
router.post('/delete/', controllerproduct.deleteproduct);
router.post('/update/:name', controllerproduct.modifierproduct);

module.exports = router;
