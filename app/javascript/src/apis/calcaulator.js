import axios from "axios";

const routes = {
  calculate: "api/calculations",
};

const calculate = (input, action) =>
  axios.post(routes.calculate, { input, action });

const calculatorApi = { calculate };

export default calculatorApi;
