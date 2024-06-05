import React, { useState } from "react";
import ReactDOM from "react-dom/client";
import Calculator from "./components/Calculator";

const App = () => {
  return (
    <div className="h-screen w-screen flex">
      <Calculator />
    </div>
  );
};

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

export default App;
