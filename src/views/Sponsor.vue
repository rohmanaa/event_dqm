<template>
  <body class="bg-body-tertiary">
    <header class="p-3 mb-3 border-bottom bg-body sticky-top">
      <div class="container">
        <div
          class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
        >
          <a
            href="/"
            class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none"
          >
            <i class="fa fa-home" aria-hidden="true"></i>
          </a>

          <ul
            class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
          ></ul>

          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <input
              type="search"
              class="form-control"
              placeholder="Search..."
              aria-label="Search"
            />
          </form>
        </div>
      </div>
    </header>
    <div class="b-example-divider"></div>
    <main class="container py-2">
      <div class="p-5 text-center bg-success shadow-sm rounded-3 mb-3">
        <h1 class="text-white fw-bold">DQM PEDULI</h1>
        <p class="col-lg-8 mx-auto fs-5 text-white">
          Selamat datang di portal Donasi DQ Peduli. Donasi aman dan mudah 😊
        </p>
      </div>

      <div class="card mb-3">
        <div class="card-header bg-warning p-3 text-center">
          <h5 class="card-title">Special title treatment</h5>
        </div>
        <img
          src="https://bankbjb.co.id/files//2023/02/design-web-donasi-double-berkah-1500x608-2.jpg"
          class="card-img-top mb-3"
          alt="..."
        />

        <div class="card-body">
          <div class="mb-5">
            <span class="badge text-bg-primary float-start p-2">Primary</span>
          </div>
          <div class="text-center mb-2">
            <p class="card-text">
              With supporting text below as a natural lead-in to additional content.
            </p>
          </div>

          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">RP. </span>
            <input
              type="number"
              class="form-control"
              placeholder="Donasi"
              aria-label="Donasi"
              aria-describedby="basic-addon1"
            />
          </div>
          <div class="d-grid gap-2">
            <button class="btn btn-primary" type="button">DONASI</button>
          </div>
        </div>
        <div class="card-footer text-body-secondary">
          Total : <span class="badge text-bg-primary">Rp. Primary</span>
        </div>
      </div>
    </main>
  </body>
  <div class="b-example-divider"></div>
  <div class="container py-2">
    <footer
      class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top"
    >
      <div class="col-md-4 d-flex align-items-center">
        <a
          href="/"
          class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1"
        >
          <i class="fa fa-home" aria-hidden="true"></i>
        </a>
        <span class="mb-3 mb-md-0 text-body-secondary">© 2023 DQM Peduli</span>
      </div>

      <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
        <li class="ms-3">
          <a class="text-body-secondary" href="#"
            ><i class="fa fa-internet-explorer" aria-hidden="true"></i>
          </a>
        </li>
      </ul>
    </footer>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
};
</script>
