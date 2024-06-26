import axios from "axios";

const routes = {
  add: "api/calculations/add",
};

const add = (input, action) => axios.post(routes.add, { input, action });

const calculatorApi = { add };

export default calculatorApi;
