import React from "react";

export default function BrandText({ className = "" }) {
  return (
    <div className={`brand-text font-semibold tracking-wide ${className}`}>
      Restauranteur
    </div>
  );
}
