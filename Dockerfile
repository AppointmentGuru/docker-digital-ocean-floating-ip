FROM appointmentguru/doctl:latest

COPY floating-ip.sh .

CMD floating-ip.sh
