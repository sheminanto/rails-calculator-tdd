import React, { useEffect, useState } from "react";
import calculatorApi from "../apis/calcaulator";
import Spinner from "./Spinner";

const Calculator = () => {
  const [inputText, setInputText] = useState("");
  const [error, setError] = useState(null);
  const [result, setResult] = useState(null);
  const [isLoading, setIsLoading] = useState(false);

  const performAddition = async () => {
    setIsLoading(true);
    setResult(null);
    setError(null);

    try {
      const response = await calculatorApi.add(inputText);
      setResult(response.data.result);
    } catch (error) {
      setError(error.response.data.message);
    } finally {
      setIsLoading(false);
    }
  };
  return (
    <div className="mx-auto w-1/2 my-auto p-6 bg-white border border-gray-200 rounded-lg shadow space-y-4">
      <div className="flex flex-col w-full">
        <label htmlFor="add-input">Enter string</label>
        <input
          placeholder="//[***][%%%]\n1***2%%%3"
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
          value={inputText}
          type="text"
          name="add-input"
          onChange={(e) => setInputText(e.target.value)}
        />
      </div>
      <div className="flex space-x-4 items-center">
        <button
          disabled={isLoading}
          onClick={performAddition}
          type="button"
          className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 focus:outline-none"
        >
          Find sum
        </button>
      </div>
      {result !== null && (
        <div className="w-full m-2 flex p-6 bg-white border border-gray-200 space-y-4 rounded-sm items-center justify-center">
          Result: {result}
        </div>
      )}
      {isLoading && (
        <div className="w-full m-2 flex p-6 bg-white border border-gray-200 space-y-4 rounded-sm items-center justify-center">
          <Spinner />
        </div>
      )}
      {error !== null && (
        <div className="w-full m-2 flex p-6 bg-white border-2 border-red-200 space-y-4 rounded-sm items-center justify-center">
          {error}
        </div>
      )}
    </div>
  );
};

export default Calculator;
