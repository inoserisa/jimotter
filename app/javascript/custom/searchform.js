function initializeCitySelectForSearch() {
  var prefectureSelect = document.querySelector('select[name="q[prefecture_id_eq]"]');
  var citySelect = document.querySelector('select[name="q[city_id_eq]"]');

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
            var option = document.createElement('option');
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
    var prefectureId = this.value;
    updateCityOptions(prefectureId);
  });

  var initialPrefectureId = prefectureSelect.value;
  var initialSelectedCityId = citySelect.value;

  if (initialPrefectureId) {
    updateCityOptions(initialPrefectureId, initialSelectedCityId);
  }
}

document.addEventListener("turbo:load", initializeCitySelectForSearch);