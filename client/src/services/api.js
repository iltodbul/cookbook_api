import axios from "axios";

const API_URL = "http://localhost:3001";

const api = axios.create({
  baseURL: API_URL,
  headers: {
    "Content-Type": "application/json",
  },
});

export const recipesAPI = {
  getAll: () => api.get("/recipes"),
  getOne: (id) => api.get(`/recipes/${id}/full_info`),
  searchByIngredient: (query) =>
    api.get(`/recipes/search_by_ingredient/${query}`),
  create: (data) => api.post("/recipes", data),
  update: (id, data) => api.put(`/recipes/${id}`, data),
  delete: (id) => api.delete(`/recipes/${id}`),
};

export default api;
