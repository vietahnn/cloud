# Restauranteur SaaS POS

Restauranteur is a multi-tenant Point-of-Sale (POS) platform for restaurants, cafes, hotels, and food trucks. It includes a web POS, kitchen flow, invoicing, inventory, reports, and optional QR ordering.

## Tech Stack

- Frontend: React, Vite, Tailwind CSS, DaisyUI
- Backend: Node.js, Express.js, Socket.IO
- Database: MySQL

## Features

- Multi-tenant SaaS with roles and permissions
- POS order flow, kitchen updates, and invoice printing
- Menu, category, and addon management
- Tables and floors
- Inventory tracking and usage logs
- Reports and dashboards
- QR menu and feedback flow
- Email receipts (SMTP)

## Requirements

- Node.js 16+
- MySQL 8+
- Git

## Setup

1) Clone the repo

```bash
git clone https://github.com/your-org/restauranteur.git
cd restauranteur
```

2) Backend install

```bash
cd backend
npm install
```

3) Backend env

Copy [backend/.env.example](backend/.env.example) to [backend/.env](backend/.env) and set values. Minimum for local dev:

```env
DATABASE_URL="mysql://user:pass@localhost:3306/restauranteur"
JWT_SECRET=restro_jwt_secret
JWT_EXPIRY=15m
JWT_EXPIRY_REFRESH=30d
COOKIE_EXPIRY=300000
COOKIE_EXPIRY_REFRESH=2592000000
PASSWORD_SALT=10
FRONTEND_DOMAIN="http://localhost:5173"
FRONTEND_DOMAIN_COOKIE="localhost"
ENCRYPTION_KEY=uiflow
```

Optional SMTP for email receipts:

```env
SMTP_HOST=smtp.yourprovider.com
SMTP_PORT=587
SMTP_EMAIL=you@domain.com
SMTP_PASSWORD=app_password_or_smtp_password
```

4) Database

Create a MySQL database and import one of the SQL files under [database](database). Example:

```bash
mysql -u root -p restauranteur < database/restropro_saas.sql
```

5) Frontend install

```bash
cd ../frontend
npm install
```

6) Frontend env

Copy [frontend/.env.example](frontend/.env.example) to [frontend/.env.local](frontend/.env.local) and set values. Example:

```env
VITE_BACKEND=http://localhost:3000/api/v1
VITE_BACKEND_SOCKET_IO=http://localhost:3000
VITE_BACKEND_IMAGES_BASE_URL=http://localhost:3000
VITE_FRONTEND_DOMAIN=http://localhost:5173
```

7) Run dev servers

Backend (default port 3000):

```bash
cd backend
npm run dev
```

Frontend (Vite, default port 5173):

```bash
cd ../frontend
npm run dev
```

Open http://localhost:5173

## Scripts

Backend:

- npm run dev
- npm start

Frontend:

- npm run dev
- npm run build
- npm run preview

## Project Structure

```
.
├── backend
│   ├── src
│   │   ├── config
│   │   ├── controllers
│   │   ├── middlewares
│   │   ├── routes
│   │   ├── services
│   │   ├── utils
│   │   └── app.js
│   └── public
├── database
├── frontend
│   ├── src
│   │   ├── components
│   │   ├── config
│   │   ├── contexts
│   │   ├── controllers
│   │   ├── helpers
│   │   ├── utils
│   │   └── views
│   └── public
└── translations
```

## Environment Variables

Backend env (see [backend/.env.example](backend/.env.example)):

- DATABASE_URL
- JWT_SECRET
- JWT_EXPIRY
- JWT_EXPIRY_REFRESH
- COOKIE_EXPIRY
- COOKIE_EXPIRY_REFRESH
- PASSWORD_SALT
- FRONTEND_DOMAIN
- FRONTEND_DOMAIN_COOKIE
- STRIPE_SECRET (optional)
- STRIPE_WEBHOOK_SECRET (optional)
- SMTP_HOST, SMTP_PORT, SMTP_EMAIL, SMTP_PASSWORD (optional)
- ENCRYPTION_KEY

Frontend env (see [frontend/.env.example](frontend/.env.example)):

- VITE_BACKEND
- VITE_BACKEND_SOCKET_IO
- VITE_BACKEND_IMAGES_BASE_URL
- VITE_FRONTEND_DOMAIN
- VITE_STRIPE_PRODUCT_SUBSCRIPTION_KEY (optional)

## License

See [LICENSE](LICENSE).

