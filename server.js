const express = require("express");
const app = express();
const cors = require("cors");
const fileUpload = require("express-fileupload");
const PORT = process.env.PORT || 4500;
const path = require("path");
const pool = require("./src/database/query");

app.use(cors());
app.use(fileUpload());
app.use(express.json());
app.use(express.static(path.join(process.cwd(), "src", "images")));

app.get("/foods:foodType", async (req, res) => {
  const { foodType } = req.params;
  const response = await pool.query(
    "select * from foods where food_type = $1",
    [foodType]
  );
  res.json(response.rows);
});

app.get("/foods", async (req, res) => {
  const response = await pool.query("select * from foods");
  res.json(response.rows);
});

app.post("/foods", async (req, res) => {
  const { img } = req.files;
  const body = req.body;
  img.mv(path.join(process.cwd(), "src", "images", img.name));
  const response = await pool.query(
    "insert into foods(food_text, food_img, food_type, food_price, food_bowl) values($1, $2, $3, $4, $5)",
    [body.text, img.name, body.type, body.price, Number(body.bowl)]
  );
  if (response.command === "INSERT") res.json("food has added!");
});

app.delete("/foods:id", async (req, res) => {
  const foodId = req.params.id;
  pool.query("delete from orders where food_id = $1", [foodId]);
  const response = await pool.query("delete from foods where food_id = $1", [
    foodId,
  ]);
  if ((response.command = "DELETE")) res.json(foodId);
});

app.get("/orders", async (req, res) => {
  const response = await pool.query(
    "select order_id, count, food_price, food_text from orders o inner join (select * from foods) f on o.food_id = f.food_id"
  );
  res.json(response.rows);
});

app.post("/order", async (req, res) => {
  const foodId = req.body.foodId;
  const count = req.body.count;
  if (count >= 1) {
    const oldOrders = await pool.query("select * from orders");
    const oldOrder = oldOrders.rows.find((item) => item.food_id == foodId);
    if (oldOrder) {
      const oldCount = oldOrder.count;
      const response = await pool.query(
        "update orders set count = $1 where food_id = $2",
        [count + oldCount, foodId]
      );
      if (response.command) res.json("order has added!");
    } else {
      const response = await pool.query(
        "insert into orders(food_id, count) values($1, $2)",
        [foodId, count]
      );
      if (response.command) res.json("order has added!");
    }
  }
});

app.delete("/order:id", async (req, res) => {
  const orderId = req.params.id;
  const response = await pool.query("delete from orders where order_id = $1", [
    orderId,
  ]);
  res.send(response.command);
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
