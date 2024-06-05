import axios from "axios";

const routes = {
  add: "api/calculations/add",
};

const add = (input) => axios.post(routes.add, { input });

const calculatorApi = { add };

export default calculatorApi;
