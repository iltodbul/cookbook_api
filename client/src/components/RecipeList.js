import React, { useEffect, useState } from "react";
import { recipesAPI } from "../services/api";

import { styled } from "@mui/material/styles";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import ButtonBase from "@mui/material/ButtonBase";

const Img = styled("img")({
  margin: "auto",
  display: "block",
  maxWidth: "100%",
  maxHeight: "100%",
});

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
      <h2>Нашите Топ 10 рецепти</h2>
      <Grid container spacing={2}>
        {recipes.map((recipe) => (
          <Grid key={recipe.id} item xs={12} sm container>
            <Grid item xs container direction="column" spacing={2}>
              <Grid item xs>
                <Typography gutterBottom variant="subtitle1" component="div">
                  {recipe.name}
                </Typography>
                <Typography variant="body2" gutterBottom>
                  Категория: {recipe.category.name}
                </Typography>
                <Typography variant="body2" sx={{ color: "text.secondary" }}>
                  Създадена от: <b>{recipe.cook.name}</b> на {""}
                  <b>{formatDate(recipe.created_at)}</b>
                </Typography>
              </Grid>
              <Grid item>
                <ButtonBase sx={{ width: 328, height: 328 }}>
                  <Img
                    alt={`Рецепта ${recipe.name}`}
                    src={recipe.images_url[0]}
                  />
                </ButtonBase>
              </Grid>
            </Grid>
          </Grid>
        ))}
      </Grid>
    </Paper>
  );
};

export default RecipeList;
