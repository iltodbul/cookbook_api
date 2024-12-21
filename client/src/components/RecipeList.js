import React, { useEffect, useState } from "react";
import { recipesAPI } from "../services/api";

import { styled } from "@mui/material/styles";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import ComplexGrid from "./ComplexGrid";

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
    <Paper
      sx={(theme) => ({
        p: 2,
        margin: "auto",
        maxWidth: 1200,
        flexGrow: 1,
        backgroundColor: "#fff",
        ...theme.applyStyles("dark", {
          backgroundColor: "#1A2027",
        }),
      })}
    >
      <h2>Нашите Топ {recipes.length} рецепти</h2>
      <Grid container spacing={2}>
        {recipes.map((recipe) => (
          <Grid key={recipe.id} item xs={12} sm container>
            <ComplexGrid recipe={recipe} />
          </Grid>
        ))}
      </Grid>
    </Paper>
  );
};

export default RecipeList;
