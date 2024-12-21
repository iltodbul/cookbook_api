import React from "react";
import Paper from "@mui/material/Paper";
import { useLocation } from "react-router-dom";

const Recipe = () => {
  const location = useLocation();
  const { recipe } = location.state;

  if (!recipe) return null;

  return (
    <Paper
      elevation={3}
      sx={{ p: 2, margin: "auto", maxWidth: 1200, flexGrow: 1 }}
    >
      <h2>{recipe.name}</h2>
      <p>Категория: {recipe.category}</p>
      <p>Създадена от: {recipe.cook_name}</p>
      <p>Дата на създаване: {recipe.created}</p>
      <p>Време за приготвяне: {recipe.preparation_time}</p>
      <p>Време за готвене: {recipe.cooking_time}</p>
      <p>Брой порции: {recipe.portions_count}</p>
      <img src={recipe.images[0]} alt={`Рецепта ${recipe.name}`} />
      <h3>Необходими продукти:</h3>
      <ul style={{ listStyleType: "none", padding: 0 }}>
        {recipe.recipe_ingredients.map((ingredient) => (
          <li key={ingredient.ingredient_id}>
            <b>{ingredient.ingredient}</b>: {ingredient.quantity}
          </li>
        ))}
      </ul>
      <h3>Инструкции:</h3>
      <p>{recipe.instructions}</p>
    </Paper>
  );
};

export default Recipe;
