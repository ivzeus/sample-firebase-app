import express from "express";
import helmet from "helmet";
import dotenv from "dotenv";
import { readFileSync } from "fs";

dotenv.config();

const app = express();

// Use Helmet!
app.use(helmet());

app.get("/", (req, res) => {
  const buildSignature = readFileSync("./_buildSignature.txt", "utf8");
  res.send(`Build ${buildSignature}`);
});

app.listen(3000, () => {
  console.log(`App listening at port 3000`);
});
