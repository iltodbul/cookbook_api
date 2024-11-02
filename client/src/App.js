// import logo from "./logo.svg";
import "./App.css";
import React from "react";
import RecipeList from "./components/RecipeList";
import ComplexGrid from "./components/ComplexGrid";

function App() {
  return (
    <div className="App">
      <h1>ГОТВАРСКА КНИГА</h1>
      <RecipeList />
      {/* <ComplexGrid /> */}
    </div>
  );
}

export default App;
