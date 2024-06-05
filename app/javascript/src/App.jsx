import React from "react";
import ReactDOM from "react-dom/client";

const App = () => (
  <h1 className="text-3xl font-bold underline bg-red-400">
    Helloooooo world! 1234
  </h1>
);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

export default App;
