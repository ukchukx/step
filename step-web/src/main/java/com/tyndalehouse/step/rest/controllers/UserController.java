/*******************************************************************************
 * Copyright (c) 2012, Directors of the Tyndale STEP Project
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions 
 * are met:
 * 
 * Redistributions of source code must retain the above copyright 
 * notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright 
 * notice, this list of conditions and the following disclaimer in 
 * the documentation and/or other materials provided with the 
 * distribution.
 * Neither the name of the Tyndale House, Cambridge (www.TyndaleHouse.com)  
 * nor the names of its contributors may be used to endorse or promote 
 * products derived from this software without specific prior written 
 * permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
 * THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
package com.tyndalehouse.step.rest.controllers;

import static com.tyndalehouse.step.core.exceptions.UserExceptionType.CONTROLLER_INITIALISATION_ERROR;
import static com.tyndalehouse.step.core.utils.ValidateUtils.notNull;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

import javax.inject.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.inject.Inject;
import com.google.inject.servlet.RequestScoped;
import com.tyndalehouse.step.core.exceptions.StepInternalException;
import com.tyndalehouse.step.core.models.ClientSession;
import com.tyndalehouse.step.core.service.UserService;

/**
 * Checking user is registered
 * 
 * @author chrisburrell
 * 
 */
@RequestScoped
public class UserController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;
    private final Provider<ClientSession> sessionProvider;

    /**
     * @param userService the main user service
     * @param sessionProvider the provider of request sessions
     */
    @Inject
    public UserController(final UserService userService, final Provider<ClientSession> sessionProvider) {
        notNull(userService, "Failed to initialise User Controller, userService was null",
                CONTROLLER_INITIALISATION_ERROR);
        notNull(sessionProvider, "Failed to initialise User Controller, sessionProvider was null",
                CONTROLLER_INITIALISATION_ERROR);
        this.userService = userService;
        this.sessionProvider = sessionProvider;

    }

    /**
     * checks a user is valid
     * 
     * @param email the email of the user
     * @param name the name of the user
     * @return true if valid user
     */
    public boolean checkValidUser(final String email, final String name) {
        return this.userService.checkUserIdentity(email, name);
    }

    /**
     * @param enable the enabled to set, true to enable
     */
    public void enable(final String enable) {
        validateSession();
        this.userService.setEnabled(Boolean.TRUE.toString().equals(enable));
    }

    /**
     * @param autoregister true to automatically create new users
     */
    public void autoregister(final String autoregister) {
        validateSession();
        this.userService.setAutoRegister(Boolean.TRUE.toString().equals(autoregister));
    }

    /** refreshes the list of users */
    public void refresh() {
        validateSession();
        this.userService.refresh();
    }

    /**
     * validates a session
     */
    private void validateSession() {
        try {
            final String ipAddress = this.sessionProvider.get().getIpAddress();
            final InetAddress addr = InetAddress.getByName(ipAddress);

            // Check if the address is a valid special local or loop back
            if (addr.isAnyLocalAddress() || addr.isLoopbackAddress()) {
                return;
            }

            // Check if the address is defined on any interface
            try {
                if (NetworkInterface.getByInetAddress(addr) != null) {
                    return;
                }
            } catch (final SocketException e) {
                LOGGER.warn("Socket error: ", e);
            }

            LOGGER.warn("DENYING ACCESS TO IP ADDRESS [{}]", ipAddress);
            throw new StepInternalException("This functionality is not available");
        } catch (final UnknownHostException e) {
            throw new StepInternalException("Failed to initialise ip addresses", e);
        }

    }
}
