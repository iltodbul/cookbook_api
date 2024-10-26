import React, { useEffect, useState } from "react";
import { recipesAPI } from "../services/api";

const RecipeList = () => {
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchRecipes = async () => {
      try {
        const response = await recipesAPI.getAll();
        setRecipes(response.data);
        setLoading(false);
      } catch (err) {
        setError("Error fetching recipes");
        setLoading(false);
      }
    };

    fetchRecipes();
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>{error}</div>;

  return (
    <div>
      <h2>Нашите Топ 10 рецепти </h2>
      <div className="recipe-list">
        {recipes.map((recipe) => (
          <div key={recipe.id} className="recipe-card">
            <h3>{recipe.name}</h3>
            <p>{recipe.instructions}</p>
            <div className="image-list">
              {recipe.images_url.map((image) => (
                <div key={recipe.id} className="image-card">
                  <image>{image}</image>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default RecipeList;
