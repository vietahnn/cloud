const escapeHtml = (value) => {
  return String(value || "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\"/g, "&quot;")
    .replace(/'/g, "&#39;");
};

const formatMoney = (amount, currency) => {
  const normalized = Number(amount || 0).toFixed(2);
  if (currency) {
    return `${currency} ${normalized}`.trim();
  }

  return normalized;
};

const buildItemRows = (items, currency) => {
  return items
    .map((item) => {
      const title = escapeHtml(item.item_title || item.title);
      const variant = item.variant_title ? ` - ${escapeHtml(item.variant_title)}` : "";
      const quantity = Number(item.quantity || 0);
      const unitPrice = Number(item.price || 0);
      const lineTotal = unitPrice * quantity;
      const addonsText = item.addons?.length
        ? `Addons: ${escapeHtml(item.addons.map((a) => a.title).join(", "))}`
        : "";
      const notesText = item.notes ? `Notes: ${escapeHtml(item.notes)}` : "";

      const metaText = [addonsText, notesText].filter(Boolean).join(" | ");

      return `
        <tr>
          <td style="padding: 8px 0;">
            <div style="font-weight: 600;">${title}${variant}</div>
            ${metaText ? `<div style=\"font-size: 12px; color: #6b7280;\">${metaText}</div>` : ""}
          </td>
          <td style="text-align: right; padding: 8px 0;">${quantity}</td>
          <td style="text-align: right; padding: 8px 0;">${formatMoney(unitPrice, currency)}</td>
          <td style="text-align: right; padding: 8px 0;">${formatMoney(lineTotal, currency)}</td>
        </tr>
      `;
    })
    .join("");
};

const buildReceiptEmailSubject = (storeSettings) => {
  const storeName = storeSettings?.store_name || "our store";
  return `Receipt from ${storeName}`;
};

const buildReceiptEmailHtml = ({
  storeSettings,
  orders,
  totals,
  paymentMethod,
  invoiceId,
}) => {
  const storeName = escapeHtml(storeSettings?.store_name || "Receipt");
  const storeAddress = escapeHtml(storeSettings?.address || "");
  const storePhone = escapeHtml(storeSettings?.phone || "");
  const storeEmail = escapeHtml(storeSettings?.email || "");
  const currency = storeSettings?.currency || "";

  const orderIds = orders.map((order) => order.id).join(", ");
  const tokens = orders.map((order) => order.token_no).filter(Boolean).join(", ");
  const orderDate = orders[0]?.date ? new Date(orders[0].date).toLocaleString("en-US") : new Date().toLocaleString("en-US");

  const customerName = escapeHtml(orders[0]?.customer_name || "");
  const customerType = escapeHtml(orders[0]?.customer_type || "");
  const deliveryType = escapeHtml(orders[0]?.delivery_type || "");
  const tableTitle = escapeHtml(orders[0]?.table_title || "");

  const items = orders.flatMap((order) => order.items || []);
  const itemRows = buildItemRows(items, currency);

  return `
    <div style="font-family: Arial, sans-serif; background: #f9fafb; padding: 24px; color: #111827;">
      <div style="max-width: 640px; margin: 0 auto; background: #ffffff; border: 1px solid #e5e7eb; border-radius: 12px; padding: 24px;">
        <h2 style="margin: 0 0 8px 0;">${storeName}</h2>
        ${storeAddress ? `<div style=\"color: #6b7280;\">${storeAddress}</div>` : ""}
        ${storePhone || storeEmail ? `<div style=\"color: #6b7280;\">${storePhone}${storePhone && storeEmail ? " | " : ""}${storeEmail}</div>` : ""}

        <hr style="border: none; border-top: 1px dashed #e5e7eb; margin: 16px 0;" />

        <div style="font-size: 14px; color: #374151;">
          <div><strong>Invoice:</strong> ${invoiceId || "-"}</div>
          <div><strong>Orders:</strong> ${escapeHtml(orderIds || "-")}</div>
          ${tokens ? `<div><strong>Tokens:</strong> ${escapeHtml(tokens)}</div>` : ""}
          <div><strong>Date:</strong> ${escapeHtml(orderDate)}</div>
          ${paymentMethod ? `<div><strong>Payment:</strong> ${escapeHtml(paymentMethod)}</div>` : ""}
          ${customerName ? `<div><strong>Customer:</strong> ${customerName}${customerType ? ` (${customerType})` : ""}</div>` : ""}
          ${deliveryType ? `<div><strong>Order Type:</strong> ${deliveryType}</div>` : ""}
          ${tableTitle ? `<div><strong>Table:</strong> ${tableTitle}</div>` : ""}
        </div>

        <hr style="border: none; border-top: 1px dashed #e5e7eb; margin: 16px 0;" />

        <table style="width: 100%; border-collapse: collapse; font-size: 14px;">
          <thead>
            <tr style="text-align: left; border-bottom: 1px solid #e5e7eb;">
              <th style="padding-bottom: 8px;">Item</th>
              <th style="text-align: right; padding-bottom: 8px;">Qty</th>
              <th style="text-align: right; padding-bottom: 8px;">Price</th>
              <th style="text-align: right; padding-bottom: 8px;">Total</th>
            </tr>
          </thead>
          <tbody>
            ${itemRows}
          </tbody>
        </table>

        <hr style="border: none; border-top: 1px dashed #e5e7eb; margin: 16px 0;" />

        <div style="font-size: 14px;">
          <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
            <span>Subtotal</span>
            <span>${formatMoney(totals?.subTotal, currency)}</span>
          </div>
          <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
            <span>Tax</span>
            <span>${formatMoney(totals?.taxTotal, currency)}</span>
          </div>
          <div style="display: flex; justify-content: space-between; margin-bottom: 6px;">
            <span>Service Charge</span>
            <span>${formatMoney(totals?.serviceChargeTotal, currency)}</span>
          </div>
          <div style="display: flex; justify-content: space-between; font-weight: 700; font-size: 16px;">
            <span>Total</span>
            <span>${formatMoney(totals?.total, currency)}</span>
          </div>
        </div>

        <p style="margin-top: 24px; font-size: 13px; color: #6b7280;">Thanks for dining with us!</p>
      </div>
    </div>
  `;
};

module.exports = {
  buildReceiptEmailHtml,
  buildReceiptEmailSubject,
};
