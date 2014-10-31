clean:
	@vagrant destroy -f

install:
	@vagrant up
	@vagrant ssh -- sudo service repose-valve restart

check:
	@curl -I http://127.0.0.1:8880/people.json -s | grep -q 200 && echo "Nginx status:  OK" || echo "Nginx status:  FAIL"
	@curl -I -H 'x-pp-user: someuser' http://127.0.0.1:8881/people.json -s | grep -q 200 && echo "Repose status: OK" || echo "Repose status: FAIL"

setup: clean install check

perf:
	@./scripts/perf.sh
