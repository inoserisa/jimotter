function setupPrefectureCitySelect(prefectureSelector, citySelector) {
  document.addEventListener("turbo:load", function() {
    var prefectureSelect = document.querySelector(prefectureSelector);
    var citySelect = document.querySelector(citySelector);

    if (!prefectureSelect || !citySelect) {
      return;
    }

    function loadCities(prefectureId, selectedCityId = null) {
      fetch(`/cities.json?prefecture_id=${prefectureId}`)
        .then(response => response.json())
        .then(data => {
          citySelect.innerHTML = '<option value="" selected>市区町村を選択</option>';
          data.forEach(function(city) {
            var option = document.createElement('option');
            option.value = city.id;
            option.text = city.name;
            if (selectedCityId && city.id == selectedCityId) {
              option.selected = true;
            }
            citySelect.appendChild(option);
          });
        })
        .catch(error => console.error('Error:', error));
    }

    prefectureSelect.addEventListener("change", function() {
      var prefectureId = this.value;
      if (prefectureId) {
        loadCities(prefectureId);
      }
    });
  });
}