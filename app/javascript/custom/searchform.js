function initializeCitySelectForSearch() {
  const prefectureSelect = document.querySelector('select[name="q[prefecture_id_eq]"]');
  const citySelect = document.querySelector('select[name="q[city_id_eq]"]');

  if (!prefectureSelect || !citySelect) {
    return;
  }

  function updateCityOptions(prefectureId, selectedCityId = null) {
    if (prefectureId) {
      fetch(`/cities.json?prefecture_id=${prefectureId}`)
        .then(response => response.json())
        .then(data => {
          citySelect.innerHTML = '<option value="">市区町村</option>';
          data.forEach(function(city) {
            const option = document.createElement('option');
            option.value = city.id;
            option.text = city.name;
            citySelect.appendChild(option);
          });

          if (selectedCityId) {
            citySelect.value = selectedCityId;
          }
        })
        .catch(error => console.error('Error:', error));
    } else {
      citySelect.innerHTML = '<option value="">市区町村</option>';
    }
  }

  prefectureSelect.addEventListener("change", function() {
    const prefectureId = this.value;
    updateCityOptions(prefectureId);
  });

  const initialPrefectureId = prefectureSelect.value;
  const initialSelectedCityId = citySelect.value;

  if (initialPrefectureId) {
    updateCityOptions(initialPrefectureId, initialSelectedCityId);
  }
}

document.addEventListener("turbo:load", initializeCitySelectForSearch);
document.addEventListener("DOMContentLoaded", initializeCitySelectForSearch);