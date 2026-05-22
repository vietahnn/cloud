import React, { useContext } from "react";
import { Link, useLocation } from "react-router-dom";
import { useTranslation } from 'react-i18next';
import {
  IconArmchair2,
  IconBuildingStore,
  IconChartArea,
  IconChefHat,
  IconChevronLeft,
  IconChevronRight,
  IconDeviceIpadHorizontal,
  IconFileInvoice,
  IconFriends,
  IconLayoutDashboard,
  IconSettings2,
  IconToolsKitchen3,
  IconUsersGroup,
} from "@tabler/icons-react";
import { clsx } from "clsx";
import BrandText from "./BrandText";
import AvatarImg from "../assets/avatar.svg";
import { iconStroke } from "../config/config";
import { getUserDetailsInLocalStorage } from "../helpers/UserDetails";
import { NavbarContext } from "../contexts/NavbarContext";
import { toggleNavbar } from "../helpers/NavbarSettings";

export default function SuperAdminNavbar() {
  const { t } = useTranslation();
  const { pathname } = useLocation();
  const user = getUserDetailsInLocalStorage();
  
  const [isNavbarCollapsed, setIsNavbarCollapsed] = useContext(NavbarContext);

  const navbarItems = [
    {
      type: "link",
      text: t('superadmin_navbar.dashboard'),
      icon: <IconLayoutDashboard stroke={iconStroke} />,
      path: "/superadmin/dashboard/home",
    },
    {
      type: "link",
      text: t('superadmin_navbar.tenants'),
      icon: <IconBuildingStore stroke={iconStroke} />,
      path: "/superadmin/dashboard/tenants",
    },
    {
      type: "link",
      text: t('superadmin_navbar.reports'),
      icon: <IconChartArea stroke={iconStroke} />,
      path: "/superadmin/dashboard/reports",
    },
  ];

  const btnToggleNavbar = () => {
    const isNavCollapsed = toggleNavbar();
    console.log(isNavCollapsed);
    if (isNavCollapsed) {
      setIsNavbarCollapsed(true);
    } else {
      setIsNavbarCollapsed(false);
    }
  };
  if (isNavbarCollapsed) {
    return (
      <div className="flex flex-col items-start gap-4 h-screen px-5 py-6 overflow-y-auto fixed left-0 top-0 bg-[linear-gradient(180deg,#2C4F9E_0%,#152C57_100%)] text-restro-sidebar-text">
        <div className="w-full text-center">
          <BrandText className="text-white text-[0.7rem] leading-tight" />
        </div>
        {navbarItems.map((item, index) => {
          if (item.type == "text") {
            return;
          }

          return (
            <Link
              key={index}
              className={clsx(
                "w-12 h-12 flex items-center justify-center rounded-full transition text-restro-sidebar-text",
                {
                  "bg-restro-sidebar-active text-white": pathname.includes(item.path),
                  "hover:bg-restro-sidebar-active": !pathname.includes(item.path),
                }
              )}
              to={item.path}
            >
              {item.icon}
            </Link>
          );
        })}

        <button
          onClick={btnToggleNavbar}
          className="w-12 h-12 flex items-center justify-center rounded-full border border-restro-border-green-light bg-restro-surface-muted hover:bg-restro-button-hover text-restro-text"
        >
          <IconChevronRight stroke={iconStroke} />
        </button>
      </div>
    );
  }

  return (
    <div className="relative h-screen">
      <div className="md:w-72 flex flex-col items-start gap-2 md:gap-3 h-screen px-5 py-6 overflow-y-auto fixed left-0 top-0 border-r border-restro-sidebar-active bg-[linear-gradient(180deg,#2C4F9E_0%,#152C57_100%)] text-restro-sidebar-text">
        <BrandText className="text-white text-lg md:text-2xl" />

        <div className="hidden md:flex items-center gap-2 w-full md:mb-6">
          <img
            src={AvatarImg}
            alt="avatar"
            className="md:w-12 md:h-12 rounded-full block"
          />
          <div>
            <p className="font-medium">{user.name}</p>
            <p className="text-xs text-restro-sidebar-muted">
              {new String(user.role).toUpperCase()}
              {user.designation && <span>, {user.designation}</span>}
            </p>
          </div>
        </div>

        {navbarItems.map((item, index) => {
          if (item.type == "text") {
            return (
              <p key={index} className="font-bold hidden md:block">
                {item.text}
              </p>
            );
          }

          return (
            <Link
              key={index}
              className={clsx(
                "w-12 h-12 md:w-full flex justify-center md:justify-normal items-center md:gap-2 md:px-4 md:py-3 rounded-full transition text-restro-sidebar-text",
                {
                  "bg-restro-sidebar-active text-white": pathname.includes(item.path),
                  "hover:bg-restro-sidebar-active": !pathname.includes(item.path),
                }
              )}
              to={item.path}
            >
              {item.icon} <p className="hidden md:block">{item.text}</p>
            </Link>
          );
        })}
      </div>

      <button
        onClick={btnToggleNavbar}
        className="w-9 h-9 hidden md:flex items-center justify-center rounded-full border transition bg-restro-surface-muted border-restro-border-green hover:bg-restro-button-hover text-restro-text fixed bottom-4 left-[17.5rem] -translate-x-1/2"
      >
        <IconChevronLeft stroke={iconStroke} size={18} />
      </button>
    </div>
  );
}
