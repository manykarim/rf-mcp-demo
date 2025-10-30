*** Settings ***
Library    robotmcp.attach.McpAttach    token=${DEBUG_TOKEN}
Library    SeleniumLibrary

*** Variables ***
${DEBUG_TOKEN}    change-me

*** Test Cases ***
Connect via Debug Bridge
    Open Browser    https://robotframework.org    firefox
    MCP Serve    port=7317    token=${DEBUG_TOKEN}    mode=blocking    poll_ms=100
    [Teardown]    MCP Stop