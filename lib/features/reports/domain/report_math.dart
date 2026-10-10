class ReportMath {
  static int revenue({required int sales, required int returns}) =>
      sales - returns;
  static int gross({required int revenue, required int cogs}) => revenue - cogs;
  static int net({required int gross, required int expenses}) =>
      gross - expenses;
  static bool contains(DateTime value, DateTime from, DateTime to) =>
      !value.isBefore(from) && value.isBefore(to);
}
