import React from "react";
import BrandText from "../../components/BrandText";
import { Link } from "react-router-dom";
import { IconMenu } from "@tabler/icons-react";
import { useTranslation } from "react-i18next";

export default function LNavbar() {
  const { t } = useTranslation();

  const closeDrawer = () => {
    document.getElementById("my-drawer").checked = false;
  };

  return (
    <div className="w-full backdrop-blur-md sticky top-0 bg-restro-surface lg:px-12 border-b border-restro-border-green">
      <input id="my-drawer" type="checkbox" className="drawer-toggle" />
      <div className="flex items-center justify-between gap-4 container mx-auto px-4 py-3">
        <div>
          <BrandText className="text-restro-green-dark text-lg" />
        </div>
        <div className="items-center hidden lg:flex">
          <a
            className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
            href="#features"
          >
            {t("landing_page.features")}
          </a>
          <a
            className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
            href="#pricing"
          >
            {t("landing_page.pricing")}
          </a>
          <a
            className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
            href="#contact"
          >
            {t("landing_page.contact")}
          </a>
        </div>
        <div className="hidden lg:flex items-center gap-4">
          <Link
            className="hover:bg-restro-surface-muted text-restro-green-dark rounded-full px-4 py-2 transition active:scale-95"
            to="/login"
          >
            {t("landing_page.login")}
          </Link>
          <Link
            className="hover:bg-restro-green-button-hover bg-restro-green text-white rounded-full px-4 py-2 transition active:scale-95 shadow-sm"
            to="/register"
          >
            {t("landing_page.get_started")}
          </Link>
        </div>

        {/* mobile btn */}
        <div className="block lg:hidden">
          <label
            aria-label="open sidebar"
            htmlFor="my-drawer"
            className="w-12 h-12 rounded-full flex items-center justify-center bg-restro-surface-muted hover:bg-restro-button-hover active:scale-95 text-restro-text transition"
          >
            <IconMenu />
          </label>
        </div>
        {/* mobile btn */}
      </div>

      {/* mobile menu */}
      <div className="drawer-side">
        <label
          htmlFor="my-drawer"
          aria-label="close sidebar"
          className="drawer-overlay "
        ></label>
        <ul className="menu p-4 w-80 min-h-full text-base-content bg-restro-surface">
          {/* Sidebar content here */}
          <div className="mb-8">
            <BrandText className="text-restro-green-dark text-lg" />
          </div>
          <li onClick={closeDrawer}>
            <a
              className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
              href="#features"
            >
              {t("landing_page.features")}
            </a>
          </li>
          <li onClick={closeDrawer}>
            <a
              className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
              href="#pricing"
            >
              {t("landing_page.pricing")}
            </a>
          </li>
          <li onClick={closeDrawer}>
            <a
              className="hover:bg-restro-surface-muted text-restro-text rounded-full px-4 py-2 transition active:scale-95"
              href="#contact"
            >
              {t("landing_page.contact")}
            </a>
          </li>
          <li onClick={closeDrawer} className="mt-8">
            <Link
              className="hover:bg-restro-surface-muted border border-restro-border-green text-center block text-restro-green-dark rounded-full px-4 py-2 transition active:scale-95"
              to="/login"
            >
              {t("landing_page.login")}
            </Link>
          </li>
          <li onClick={closeDrawer} className="mt-4">
            <Link
              className="hover:bg-restro-green-button-hover block text-center bg-restro-green text-white rounded-full px-4 py-2 transition active:scale-95"
              to="/register"
            >
              {t("landing_page.get_started")}
            </Link>
          </li>
        </ul>
      </div>
      {/* mobile menu */}
    </div>
  );
}
