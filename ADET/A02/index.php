<?php
$page = "feed";

if (isset($_GET['page'])) {
    $page = $_GET['page'];
    switch ($page) {
        case "feed":
            $page = "feed";
            break;
        case "rice":
            $page = "rice";
            break;
        case "ulam":
            $page = "ulam";
            break;
        case "drinks":
            $page = "drinks";
            break;
        default:
            header("Location: ?page=feed");
            break;
    }
} else {
    header("Location: ?page=feed");
}

?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>R2G</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <style>
        .profilepic {
            width: 50px;
            height: 50px;
            border-radius: 100px;
            background-color: grey;
            float: left;
        }
    </style>
</head>

<body data-bs-theme="<?php echo $theme ?>">

    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand">Rice to Go+</a>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <div class="container-fluid mt-3">
        <div class="row">

            <div class="col-1 col-sm-1 col-md-2 col-lg-3">
                <div class="card shadow rounded-5 p-3" style="height: 85vh">
                    <h4 class="my-1">Order Now</h4>
                    <a href="?page=feed" type="button" class="btn btn-primary position-relative my-1">
                        Feed
                    </a>
                    <a href="?page=rice" type="button" class="btn btn-primary position-relative my-1">
                        Rice
                    </a>
                    <a href="?page=ulam" type="button" class="btn btn-primary position-relative my-1">
                        Ulam
                    </a>
                    <a href="?page=drinks" type="button" class="btn btn-primary position-relative my-1">
                        Drinks
                    </a>
                </div>
            </div>
            <div class="col-10 col-sm-10 col-md-8 col-lg-6">
                <div class="card shadow rounded-5 p-4" style="height: 85vh; max-height: 85vh; overflow: scroll">

                    <?php include("shared/" . $page . ".php"); ?>

                </div>
            </div>
            <div class="col-1 col-sm-1 col-md-2 col-lg-3">
                <div class="card shadow rounded-5" style="height: 85vh; max-height: 85vh; overflow: scroll">
                    <div class="p-2 m-1 text-center">
                        <div>
                            Your Cart
                            <ul id="cart" class="list-group"></ul>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous">
        </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const cart = document.getElementById('cart');

            // Load cart from localStorage
            const savedCart = JSON.parse(localStorage.getItem('cartItems')) || [];
            savedCart.forEach(item => addToCart(item.name, item.price));

            // Delegate clicks to dynamically handle "Order" buttons
            document.addEventListener('click', function (e) {
                if (e.target && e.target.classList.contains('order-btn')) {
                    e.preventDefault();

                    const cardBody = e.target.closest('.card-body');
                    const itemName = cardBody.querySelector('.card-title')?.textContent || "No name";
                    const itemPrice = cardBody.querySelectorAll('.card-text');
                    const priceText = itemPrice[itemPrice.length - 1]?.textContent || "No price";

                    addToCart(itemName, priceText);
                    saveCart();
                }
            });

            function addToCart(name, price) {
                const li = document.createElement('li');
                li.className = 'list-group-item d-flex justify-content-between align-items-center';
                li.innerHTML = `
        <div>
          <strong>${name}</strong><br>
          <small>${price}</small>
        </div>
        <button class="btn btn-sm btn-danger remove-item">Remove</button>
      `;
                cart.appendChild(li);

                // Remove handler
                li.querySelector('.remove-item').addEventListener('click', function () {
                    li.remove();
                    saveCart();
                });
            }

            function saveCart() {
                const items = [];
                cart.querySelectorAll('li').forEach(li => {
                    const name = li.querySelector('strong')?.textContent;
                    const price = li.querySelector('small')?.textContent;
                    items.push({ name, price });
                });
                localStorage.setItem('cartItems', JSON.stringify(items));
            }
        });
    </script>

</body>

</html>