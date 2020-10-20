# Simple Worker

Simple worker to know how to manage this type of app

1. Execute the script [`Create-User.ps1`](./infrastructure/Create-User.ps1), to create the User;
2. Log on as a service rights
   1. Open the Local Security Policy editor by running `secpol.msc`.
   2. Expand the Local Policies node and select User Rights Assignment.
   3. Open the Log on as a service policy.
   4. Select Add User or Group.
   5. Provide the object name (user account) using either of the following approaches:
      1. Type the user account ({DOMAIN OR COMPUTER NAME\USER}) in the object name field and select OK to add the user to the policy.
      2. Select Advanced. Select Find Now. Select the user account from the list. Select OK. Select OK again to add the user to the policy.
   6. Select OK or Apply to accept the changes.
3. Execute the script [`Install.ps1`](./infrastructure/Install.ps1), to install the service into the machine.
   1. Parameters:
      1. Path - Where the files are;
      2. ExeFileName - The name from the `.exe`;
      3. UserName - The user that will execute the service;
      4. Password - Secure string containing the password for the user ([SecureString docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring?view=powershell-7));
         > `ConvertTo-SecureString "{password_here}" -AsPlainText -Force`
      5. Name - The service name;
      6. DisplayName (Optional) - A friendly name for the service;
      7. Description (Optional) - Explain what is the purpose of the service;

> For further information check the [Microsoft Documentation](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/windows-service?view=aspnetcore-3.1&tabs=visual-studio).
