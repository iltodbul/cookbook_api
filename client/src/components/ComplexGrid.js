import * as React from "react";
import { styled } from "@mui/material/styles";
import Grid from "@mui/material/Grid";
import Grid2 from "@mui/material/Grid2";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import ButtonBase from "@mui/material/ButtonBase";
import { useNavigate } from "react-router-dom";
import { recipesAPI } from "../services/api";

const Img = styled("img")({
  margin: "auto",
  display: "block",
  maxWidth: "100%",
  maxHeight: "100%",
});

const ComplexGrid = ({ recipe }) => {
  const navigate = useNavigate();

  if (!recipe) return null;

  const handleRecipeClick = async () => {
    try {
      const response = await recipesAPI.getOne(recipe.id);
      navigate(`/recipe/${recipe.id}`, { state: { recipe: response.data } });
    } catch (error) {
      console.error("Error fetching recipe data:", error);
    }
  };

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
        maxWidth: 500,
        flexGrow: 1,
        backgroundColor: "#fff",
        ...theme.applyStyles("dark", {
          backgroundColor: "#1A2027",
        }),
      })}
    >
      <Grid container spacing={2}>
        <Grid item>
          <ButtonBase
            sx={{ width: 256, height: 256 }}
            onClick={handleRecipeClick}
          >
            <Img alt={`Рецепта ${recipe.name}`} src={recipe.images_url[0]} />
          </ButtonBase>
        </Grid>
        <Grid item xs={24} sm container>
          <Grid item xs container direction="column" spacing={2}>
            <Grid item xs>
              <Typography
                gutterBottom
                variant="subtitle1"
                component="div"
                sx={{ cursor: "pointer" }}
                onClick={handleRecipeClick}
              >
                {recipe.name}
              </Typography>
              <Typography variant="body2" gutterBottom>
                Категория: {recipe.category.name}
              </Typography>
              <Typography variant="body2" sx={{ color: "text.secondary" }}>
                Създадена от: <b>{recipe.cook.name}</b> на{" "}
                <b>{formatDate(recipe.created_at)}</b>
              </Typography>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Paper>
  );
};

export default ComplexGrid;
