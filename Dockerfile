FROM mcr.microsoft.com/windows:1809

WORKDIR /Game

# Copy the game files over
COPY Game/ .

# Copy script for starting up the server
COPY start.cmd .

# Steamcmd update
RUN steamcmd.exe +login anonymous +app_update 294420 validate +quit
# Game update
RUN steamcmd.exe +login anonymous +app_update 294420 validate +quit

# Create volume for persisted data
VOLUME [ "C:/_data" ]

# Expose ports
EXPOSE 8080-8081/tcp
EXPOSE 26900/tcp
EXPOSE 26900-26902/udp

# Start server
ENTRYPOINT ["start.cmd"]
CMD ["-quit", "-batchmode", "-nographics", "-configfile=serverconfig.xml", "-dedicated"]