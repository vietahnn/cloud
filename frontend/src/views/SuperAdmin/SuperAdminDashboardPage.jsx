import React from 'react'
import Page from "../../components/Page";
import { Link } from 'react-router-dom';
import { IconArrowRight, IconArrowUpRight } from '@tabler/icons-react';
import ReactApexChart from "react-apexcharts";
import { appVersion, iconStroke, subscriptionAmount } from '../../config/config';
import { useSuperAdminDashboard } from "../../controllers/superadmin.controller";
import { useTranslation } from 'react-i18next';
import { useTheme } from '../../contexts/ThemeContext';

export default function SuperAdminDashboardPage() {
  const { t } = useTranslation();
  const { theme } = useTheme();
  const { data, error, isLoading } = useSuperAdminDashboard();

  if(isLoading) {
    return <Page>
      {t('superadmin_dashboard.please_wait')}
    </Page>
  }

  if(error) {
    console.error(error);

    return <Page>
      {t('superadmin_dashboard.error_loading')}
    </Page>
  }

  const {
    activeTenants, mrr, arr
  } = data;

  const mrrValue = mrr * subscriptionAmount
  const arrValue = arr * subscriptionAmount * 12

  const revenueSeries = [
    {
      name: "Revenue",
      data: [12, 38, 52, 46, 78, 74, 108, 122, 138, 150, 182, 205]
    }
  ];

  const revenueOptions = {
    chart: {
      type: "area",
      toolbar: { show: false },
      zoom: { enabled: false }
    },
    theme: { mode: theme === "black" ? "dark" : "light" },
    stroke: { curve: "smooth", width: 3, colors: ["#3B82F6"] },
    fill: {
      type: "gradient",
      gradient: {
        shadeIntensity: 0.2,
        opacityFrom: 0.35,
        opacityTo: 0,
        stops: [0, 90, 100]
      }
    },
    grid: {
      borderColor: theme === "black" ? "#1F2A44" : "#E5EAF2",
      strokeDashArray: 4
    },
    dataLabels: { enabled: false },
    xaxis: {
      categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      labels: { style: { colors: theme === "black" ? "#9FB2C8" : "#6B7280" } }
    },
    yaxis: {
      labels: { style: { colors: theme === "black" ? "#9FB2C8" : "#6B7280" } }
    },
    tooltip: { theme: theme === "black" ? "dark" : "light" }
  };

  const ordersSeries = [57, 28, 15];
  const ordersOptions = {
    labels: ["Dine-in", "Takeaway", "Delivery"],
    chart: { type: "donut" },
    legend: {
      position: "right",
      labels: { colors: theme === "black" ? "#9FB2C8" : "#6B7280" }
    },
    colors: ["#3B82F6", "#60A5FA", "#93C5FD"],
    dataLabels: { enabled: false },
    stroke: {
      width: 2,
      colors: theme === "black" ? ["#111A2B"] : ["#FFFFFF"]
    },
    tooltip: { theme: theme === "black" ? "dark" : "light" }
  };

  return (
    <Page className='px-6 py-5 overflow-x-hidden h-full'>
      <h3 className="text-2xl font-semibold">{t('superadmin_dashboard.title')}</h3>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 mt-6">
        <div className="bg-restro-surface border border-restro-border-green rounded-2xl p-5 shadow-sm">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-sm text-restro-text">{t('superadmin_dashboard.active_tenants')}</p>
              <p className="text-3xl font-semibold text-restro-green-dark">
                {Number(activeTenants).toLocaleString("en", { notation: "compact" })}
              </p>
            </div>
            <div className="w-9 h-9 rounded-full bg-restro-green-10 text-restro-green flex items-center justify-center">
              <IconArrowUpRight stroke={iconStroke} size={18} />
            </div>
          </div>
          <div className="mt-5">
            <svg width="100%" height="42" viewBox="0 0 120 42" fill="none">
              <path
                d="M4 34L24 24L40 28L58 18L72 20L88 10L108 12L116 6"
                stroke="#3B82F6"
                strokeWidth="3"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
            </svg>
          </div>
        </div>

        <div className="bg-restro-surface border border-restro-border-green rounded-2xl p-5 shadow-sm">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-sm text-restro-text">{t('superadmin_dashboard.mrr')}</p>
              <p className="text-3xl font-semibold text-restro-green">
                ${Number(mrrValue).toLocaleString('en', { notation: "compact" })}
              </p>
            </div>
            <div className="w-9 h-9 rounded-full bg-restro-green-10 text-restro-green flex items-center justify-center">
              <IconArrowUpRight stroke={iconStroke} size={18} />
            </div>
          </div>
        </div>

        <div className="bg-restro-surface border border-restro-border-green rounded-2xl p-5 shadow-sm">
          <div className="flex items-start justify-between">
            <div>
              <p className="text-sm text-restro-text">{t('superadmin_dashboard.arr')}</p>
              <p className="text-3xl font-semibold text-restro-green">
                ${Number(arrValue).toLocaleString('en', { notation: "compact" })}
              </p>
            </div>
            <div className="w-9 h-9 rounded-full bg-restro-green-10 text-restro-green flex items-center justify-center">
              <IconArrowUpRight stroke={iconStroke} size={18} />
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 mt-6">
        <div className="lg:col-span-2 bg-restro-surface border border-restro-border-green rounded-2xl p-6 shadow-sm">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-3">
            <h4 className="font-semibold">Revenue Growth</h4>
            <div className="flex items-center gap-3 text-sm text-restro-text">
              <div className="flex items-center gap-2">
                <span className="w-2 h-2 rounded-full bg-restro-green"></span>
                Legend
              </div>
              <select className="border border-restro-border-green rounded-full px-3 py-1 bg-restro-surface text-restro-text">
                <option>last 12 months</option>
              </select>
            </div>
          </div>

          <div className="mt-4">
            <ReactApexChart options={revenueOptions} series={revenueSeries} type="area" height={240} />
          </div>

          <div className="flex justify-end text-sm text-restro-text">
            <Link to="/superadmin/dashboard/reports" className="flex items-center gap-2 hover:text-restro-green">
              {t('superadmin_dashboard.view_more')}
              <IconArrowRight stroke={iconStroke} size={16} />
            </Link>
          </div>
        </div>

        <div className="bg-restro-surface border border-restro-border-green rounded-2xl p-6 shadow-sm">
          <h4 className="font-semibold">Orders by Category</h4>
          <div className="mt-4">
            <ReactApexChart options={ordersOptions} series={ordersSeries} type="donut" height={240} />
          </div>
          <div className="flex justify-end text-sm text-restro-text">
            <Link to="/superadmin/dashboard/reports" className="flex items-center gap-2 hover:text-restro-green">
              {t('superadmin_dashboard.view_more')}
              <IconArrowRight stroke={iconStroke} size={16} />
            </Link>
          </div>
        </div>
      </div>

      <div className="mt-10 text-center text-sm text-restro-text">
        © Restauranteur Version {appVersion}
      </div>
    </Page>
  )
}
