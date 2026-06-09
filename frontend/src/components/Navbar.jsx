import React, { useContext } from "react";
import { Link, useLocation } from "react-router-dom";
import {
  IconArmchair2,
  IconBuildingWarehouse,
  IconChartArea,
  IconChefHat,
  IconChevronLeft,
  IconChevronRight,
  IconDeviceIpadHorizontal,
  IconFileInvoice,
  IconFriends,
  IconLayoutDashboard,
  IconSettings2,
  IconStars,
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
import { SCOPES } from "../config/scopes";
import { useTranslation } from "react-i18next";

export default function Navbar() {
  const { t } = useTranslation();
  const { pathname } = useLocation();
  const user = getUserDetailsInLocalStorage();
  const { role: userRole, scope } = user;
  const userScopes = scope ? scope.split(",") : [];
  const [isNavbarCollapsed, setIsNavbarCollapsed] = useContext(NavbarContext);

  const navbarItems = [
    {
      type: "link",
      text: t("navbar.dashboard"),
      icon: <IconLayoutDashboard stroke={iconStroke} />,
      path: "/dashboard/home",
      scopes: [SCOPES.DASHBOARD]
    },
    {
      type: "link",
      text: t("navbar.pos"),
      icon: <IconDeviceIpadHorizontal stroke={iconStroke} />,
      path: "/dashboard/pos",
      scopes: [SCOPES.POS]
    },
    {
      type: "link",
      text: t("navbar.orders"),
      icon: <IconToolsKitchen3 stroke={iconStroke} />,
      path: "/dashboard/orders",
      scopes: [SCOPES.POS, SCOPES.ORDERS, SCOPES.ORDER_STATUS, SCOPES.ORDER_STATUS_DISPLAY]
    },
    {
      type: "link",
      text: t("navbar.kitchen"),
      icon: <IconChefHat stroke={iconStroke} />,
      path: "/dashboard/kitchen",
      scopes: [SCOPES.KITCHEN, SCOPES.KITCHEN_DISPLAY]
    },
    {
      type: "text",
      text: t("navbar.offerings"),
    },
    {
      type: "link",
      text: t("navbar.reservation"),
      icon: <IconArmchair2 stroke={iconStroke} />,
      path: "/dashboard/reservation",
      scopes: [SCOPES.RESERVATIONS, SCOPES.VIEW_RESERVATIONS, SCOPES.MANAGE_RESERVATIONS]
    },
    {
      type: "link",
      text: t("navbar.customers"),
      icon: <IconFriends stroke={iconStroke} />,
      path: "/dashboard/customers",
      scopes: [SCOPES.CUSTOMERS, SCOPES.VIEW_CUSTOMERS, SCOPES.MANAGE_CUSTOMERS]
    },
    {
      type: "link",
      text: t("navbar.invoices"),
      icon: <IconFileInvoice stroke={iconStroke} />,
      path: "/dashboard/invoices",
      scopes: [SCOPES.INVOICES]
    },
    {
      type: "link",
      text: "Inventory",
      icon: <IconBuildingWarehouse stroke={iconStroke} />,
      path: "/dashboard/inventory",
      scopes: [SCOPES.INVENTORY]
    },
    {
      type: "text",
      text: t("navbar.back_office"),
    },
    {
      type: "link",
      text: t("navbar.feedbacks"),
      icon: <IconStars stroke={iconStroke} />,
      path: "/dashboard/feedbacks",
      scopes: [SCOPES.FEEDBACK]
    },
    {
      type: "link",
      text: t("navbar.users"),
      icon: <IconUsersGroup stroke={iconStroke} />,
      path: "/dashboard/users",
      scopes: []
    },
    {
      type: "link",
      text: t("navbar.reports"),
      icon: <IconChartArea stroke={iconStroke} />,
      path: "/dashboard/reports",
      scopes: [SCOPES.REPORTS]
    },
    {
      type: "link",
      text: t("navbar.settings"),
      icon: <IconSettings2 stroke={iconStroke} />,
      path: "/dashboard/settings",
      scopes: [SCOPES.SETTINGS]
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
        {navbarItems.filter((navItem)=>{
          const requiredScopes = navItem.scopes;
          if(navItem.type=="link") {
            if(userRole == "admin") {
              return true;
            }

            return requiredScopes.some((scope)=>userScopes.includes(scope));
          }
        }).map((item, index) => {
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
              {React.cloneElement(item.icon, {
                className: "transition-colors text-current",
              })}
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
      <div className="flex flex-col items-start gap-2 md:w-72 md:gap-3 h-screen px-5 py-6 overflow-y-auto fixed left-0 top-0 bg-[linear-gradient(180deg,#2C4F9E_0%,#152C57_100%)] text-restro-sidebar-text">
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

        {navbarItems.filter((navItem)=>{
          const requiredScopes = navItem.scopes;
          if(navItem.type=="text") {
            return true;
          }
          if(navItem.type=="link") {
            if(userRole == "admin") {
              return true;
            }

            return requiredScopes.some((scope)=>userScopes.includes(scope));
          }
        }).map((item, index) => {
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
            to={item.path}
            className={clsx(
              "w-12 h-12 md:w-full flex justify-center md:justify-normal items-center md:gap-2 md:px-4 md:py-3 rounded-full transition group text-restro-sidebar-text",
              {
                "bg-restro-sidebar-active text-white": pathname.includes(item.path),
                "hover:bg-restro-sidebar-active": !pathname.includes(item.path),
              }
            )}
          >
            {React.cloneElement(item.icon, {
              className: "transition-colors text-current",
            })}
            <p className="hidden md:block transition-colors">
              {item.text}
            </p>
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
