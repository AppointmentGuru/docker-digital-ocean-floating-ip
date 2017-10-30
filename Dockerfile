FROM appointmentguru/doctl:latest

COPY floating-ip.sh .

ENTRYPOINT floating-ip.sh
