<?php
include 'connection.php';
// Fetch settings from the database
$sql = "SELECT * FROM settings LIMIT 1";
$result = $conn->query($sql);
$settings = $result ? $result->fetch_assoc() : [];
$system_name = $settings['system_name'] ?? 'BUREAU OF FIRE PROTECTION ARCHIVING SYSTEM';
$logo = !empty($settings['logo']) ? 'webfonts/' . $settings['logo'] : 'REPORT.png';
$contact_email = $settings['contact_email'] ?? '';
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta
      name="description"
      content="<?php echo htmlspecialchars($system_name); ?>. Search, create and manage archive reports."
    />
    <link rel="icon" type="image/png" href="<?php echo htmlspecialchars($logo); ?>" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="css/all.min.css" />
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <title><?php echo htmlspecialchars($system_name); ?> — Home</title>
    <style>
      .image-container {
        min-height: 420px;
        background: linear-gradient(90deg, #ffa700 0%, #bd000a 100%);
        background-image: url(film\ archive.jpg);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        position: relative;
        width: 100%;
      }
      .image-container::after {
        content: "";
        position: absolute;
        inset: 0;
        background: rgba(0,0,0,0.35);
        z-index: 0;
      }
      .hero {
        position: relative;
        z-index: 1;
        text-align: left;
        max-width: 700px;
        padding: 60px 40px;
        margin-left: 40px;
      }
      .hero-title {
        font-size: 2.7rem;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: #fff;
        margin-bottom: 18px;
        line-height: 1.1;
        text-shadow: 0 2px 8px rgba(0,0,0,0.18);
      }
      .hero-desc {
        font-size: 1.25rem;
        color: #f0f0f0;
        margin-bottom: 32px;
        text-shadow: 0 1px 4px rgba(0,0,0,0.12);
      }
      .hero-ctas {
        margin-top: 10px;
      }
      .btn.cta {
        background: #ffa700;
        color: #6a1b9a;
        font-weight: 700;
        border-radius: 8px;
        padding: 14px 32px;
        font-size: 1.1rem;
        border: none;
        box-shadow: 0 2px 8px rgba(0,0,0,0.10);
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: background 0.2s, color 0.2s;
        cursor: pointer;
      }
      .btn.cta:hover {
        background: #ffd54f;
        color: #d32f2f;
      }
      .features {
        padding: 48px 20px 36px 20px;
        text-align: center;
        background: #fff;
      }
      .features-title {
        font-size: 2rem;
        margin-bottom: 24px;
        color: #d32f2f;
        font-weight: 700;
      }
      .features .cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 24px;
        max-width: 1000px;
        margin: 18px auto;
      }
      .card {
        padding: 28px 18px 22px 18px;
        border-radius: 12px;
        background: #f7f7f7;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        transition: box-shadow 0.2s, transform 0.2s;
        position: relative;
        text-align: left;
      }
      .card:hover {
        box-shadow: 0 6px 24px rgba(211,47,47,0.12);
        transform: translateY(-4px) scale(1.03);
      }
      .card h3 {
        font-size: 1.3rem;
        margin-bottom: 8px;
        color: #d32f2f;
        font-weight: 700;
      }
      .card p {
        font-size: 1rem;
        color: #444;
      }
      .card hr {
        border: none;
        border-top: 2px solid #ffa700;
        margin: 10px 0 16px 0;
      }
      footer {
        position: static;
        z-index: 1;
        clear: both;
      }
    </style>
  </head>
  <body>
    <a
      class="skip-link"
      href="#main"
      style="
        position: absolute;
        left: -999px;
        top: auto;
        width: 1px;
        height: 1px;
        overflow: hidden;
      "
      >Skip to content</a
    >

    <header role="banner">
      <nav class="navbar" role="navigation" aria-label="Primary">
    <a href="index.php" class="logo" style="display: flex; align-items: center; gap: 10px; color:#f7f7f7; text-decoration: none; font-weight: bold; font-size: 20px;">
        <img src="<?php echo htmlspecialchars($logo); ?>" alt="Logo" style="height: 40px; width: auto; border: 1px solid #fff; border-radius:30px; background-color: #f7f7f7;">
        <?php echo htmlspecialchars($system_name); ?>
      </a>
        <ul class="nav-links">
          <li><a href="About.php">ABOUT US</a></li>
          <li><a href="user/signup.php">SIGN UP</a></li>
          <li><a href="login.html">LOGIN</a></li>
        </ul>
      </nav>

    </header>

    <main id="main" role="main">
      <section class="image-container" aria-label="Hero">
        <div class="hero">
          <div class="hero-title">BUREAU OF FIRE PROTECTION REPORT ARCHIVING SYSTEM</div>
          <div class="hero-desc">Search, create and manage official reports securely and efficiently.</div>

        </div>
      </section>

      <section class="features">
        <div class="features-title">WHAT YOU CAN DO</div>
        <div class="cards">
          <article class="card">
            <h3>SEARCH ARCHIVES</h3>
            <hr />
          <p>Quickly find documents by name, date or tags.</p>
          </article>
          <article class="card">
            <h3>CREATE REPORTS</h3>
            <hr>
            <p> Create and Manage Reports. </p>
          </article>
          <article class="card">
            <h3>REPORTS</h3>
            <hr>
            <p>Generate detailed reports of archived documents.</p>
          </article>
        </div>
      </section>

      <section class="welcome-box" aria-label="Welcome">
        <h2><?php echo htmlspecialchars($system_name); ?></h2>
        <hr />
        <p>
          We are glad to have you here! Explore our services and learn more
          about what we offer.
        </p>
      </section>
    </main>

    <footer role="contentinfo">
      <div class="footer-content">
        <p>&copy; Copyright 2025. All rights reserved. <?php if($contact_email) echo 'Contact: ' . htmlspecialchars($contact_email); ?></p>
      </div>
    </footer>
  </body>
</html>
