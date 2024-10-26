import React, { useEffect, useState } from "react";
import { recipesAPI } from "../services/api";
import "./RecipeList.css";
import Ingredients from "./Ingredients";

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

  function formatDate(date) {
    const formattedDate = new Date(date).toLocaleDateString("bg-BG", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
    return formattedDate;
  }

  return (
    <div>
      <h2>Нашите Топ 10 рецепти</h2>
      <div className="recipe-list">
        {recipes.map((recipe) => (
          <div key={recipe.id} className="recipe-card">
            <h3>{recipe.name}</h3>
            <p>
              Създадена от: <b>{recipe.cook.name}</b> на {""}
              <b>{formatDate(recipe.created_at)}</b>
            </p>
            <h6>Категория: {recipe.category.name}</h6>
            <div className="image-list">
              {recipe.images_url.map((imageUrl, index) => (
                <div key={`${recipe.id}-${index}`} className="image-card">
                  <img
                    src={imageUrl}
                    alt={`Recipe ${recipe.name}`}
                    className="recipe-image"
                  />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );

  //   return (
  //     <div>
  //       <h2>Нашите Топ 10 рецепти</h2>
  //       <div className="recipe-list">
  //         {recipes.map((recipe) => (
  //           <div key={recipe.id} className="recipe-card">
  //             <h3>{recipe.name}</h3>
  //             <p>
  //               Създадена от: <b>{recipe.cook.name}</b> на {""}
  //               <b>{formatDate(recipe.created_at)}</b>
  //             </p>
  //             <h6>Категория: {recipe.category.name}</h6>
  //             <h5>Необходими продукти:</h5>
  //             <Ingredients />
  //             <h5>НАЧИН НА ПРИГОТВЯНЕ:</h5>
  //             <p>{recipe.instructions}</p>
  //             <div className="image-list">
  //               {recipe.images_url.map((imageUrl, index) => (
  //                 <div key={`${recipe.id}-${index}`} className="image-card">
  //                   <img
  //                     src={imageUrl}
  //                     alt={`Recipe ${recipe.name}`}
  //                     className="recipe-image"
  //                   />
  //                 </div>
  //               ))}
  //             </div>
  //           </div>
  //         ))}
  //       </div>
  //     </div>
  //   );
};

export default RecipeList;
