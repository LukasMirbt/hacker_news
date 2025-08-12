cov: 
	very_good test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
f:
	dart run build_runner build --delete-conflicting-outputs
migration: 
	dart run drift_dev make-migrations