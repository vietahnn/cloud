import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { VitePWA } from "vite-plugin-pwa";

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    proxy: {
      "/api": {
        target: "http://13.215.200.18:3000",
        changeOrigin: true,
        secure: false,
      },
      "/socket.io": {
        target: "http://13.215.200.18:3000",
        ws: true,
        changeOrigin: true,
        secure: false,
      },
      "/public": {
        target: "http://13.215.200.18:3000",
        changeOrigin: true,
        secure: false,
      },
    },
  },
  plugins: [
    react(),
    VitePWA({
      registerType: "autoUpdate",
      manifest: {
        name: "Restauranteur",
        short_name: "Restauranteur",
        description: "Restaurant operations platform for cafes, hotels, bars, food trucks, and stalls.",
        theme_color: "#0F1B2D",
        icons: [
          {
            src: "/logo_192.png",
            sizes: "192x192",
            type: "image/png",
          },
          {
            src: "/logo.png",
            sizes: "512x512",
            type: "image/png",
          },
        ],
      },
    }),
  ],
});
