import "./App.css";
import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import RecipeList from "./components/RecipeList";
import Recipe from "./components/Recipe";

function App() {
  return (
    <div className="App">
      <h1>ГОТВАРСКА КНИГА</h1>
      <Router>
        <Routes>
          <Route path="/" element={<RecipeList />} />
          <Route path="/recipe/:id" element={<Recipe />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
