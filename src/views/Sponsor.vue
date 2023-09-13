<template>
  <div class="container py-3">
    <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
      <h1 class="display-4 fw-normal text-body-emphasis">Kontribusi</h1>
      <p class="fs-5 text-body-secondary">Berikan Kontribusi Terbaik Anda.</p>
    </div>
    <main>
      <div class="row mb-3 text-center">
        <div class="col-lg-6">
          <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">DQ PEDULI</h4>
            </div>
            <div class="card-body">
              <h5 class="card-title pricing-card-title">
                Beasiswa Pendidikan Anak Yatim
              </h5>
              <ul class="list-unstyled mt-3 mb-4">
                <input
                  type="number"
                  class="form-control"
                  id="beasiswaanakyatim"
                  placeholder="Rp."
                />
              </ul>
              <button type="button" class="w-100 btn btn-lg btn-primary">Donasi</button>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">DQ PEDULI</h4>
            </div>
            <div class="card-body">
              <h5 class="card-title pricing-card-title">Insentif Guru Ngaji</h5>
              <ul class="list-unstyled mt-3 mb-4">
                <input
                  type="number"
                  class="form-control"
                  id="insentifgurungaji"
                  placeholder="Rp."
                />
              </ul>
              <button type="button" class="w-100 btn btn-lg btn-primary">Donasi</button>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">DQ PEDULI</h4>
            </div>
            <div class="card-body">
              <h5 class="card-title pricing-card-title">
                Penghapusan Buta Huruf Al-Quran
              </h5>
              <ul class="list-unstyled mt-3 mb-4">
                <input
                  type="numberl"
                  class="form-control"
                  id="butahurufquran"
                  placeholder="Rp. "
                />
              </ul>
              <button type="button" class="w-100 btn btn-lg btn-primary">Donasi</button>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">SPONSORSHIP</h4>
            </div>
            <div class="card-body">
              <h5 class="card-title pricing-card-title">Sponsor Event</h5>
              <ul class="list-unstyled mt-3 mb-4">
                <input
                  type="number"
                  class="form-control"
                  id="sponsorevent"
                  placeholder="Rp."
                />
              </ul>
              <button type="button" class="w-100 btn btn-lg btn-primary">Donasi</button>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
};
</script>
