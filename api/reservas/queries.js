const QReservasAll = `
  SELECT
     rb.booking_code, rb.pickup_timestamp, rcus.last_name, rcus.first_name, payment_successful
  FROM wp_car_rental_bookings rb
    LEFT JOIN wp_car_rental_calendar as rc ON rb.booking_id = rc.booking_id
    INNER JOIN wp_car_rental_booking_options as rbo ON rbo.item_sku = rb.booking_id
    INNER JOIN wp_car_rental_items as ri ON rbo.item_sku = ri.item_sku
    LEFT JOIN wp_car_rental_customers as rcus ON rb.customer_id = rcus.customer_id
`;

const QReservasAll2 = `
  SELECT rb.booking_code, rb.pickup_timestamp, rcus.last_name, rcus.first_name, payment_successful 
  FROM wp_car_rental_bookings rb 
    LEFT JOIN wp_car_rental_calendar rc ON rb.booking_id = rc.booking_id
    INNER JOIN wp_car_rental_booking_options  rbo ON rbo.booking_id = rb.booking_id
    INNER JOIN wp_car_rental_items  ri ON rbo.item_sku = ri.item_sku
    LEFT JOIN wp_car_rental_customers rcus ON rb.customer_id = rcus.customer_id
    WHERE 1
`;

module.exports.QReservasAll = QReservasAll2;