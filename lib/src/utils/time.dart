String HttpDateParse(String httpDate) {
  var date = httpDate.split(' ');
  var tempDate = date[3];
  date[3] = date[4];
  date[4] = tempDate;
  var newDate = '${date[0]} ${date[1]} ${date[2]} ${date[3]} ${date[4]}';
  return newDate;
}
