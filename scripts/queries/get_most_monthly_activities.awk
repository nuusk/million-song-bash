BEGIN {
	FS=",";
	OFS=","
}

{
  monthly_activities[$3]++;
}

END {
  for (i in monthly_activities) {
    print i, monthly_activities[i];
  }
}
